module Watchman
  class Call
    def initialize(page)
      @page = page
    end
    
    def raw_notes
      notes.map{|n| "#{n[:time]} #{n[:text]}"}.join("|")
    end
    
    def notes
      xpath("/html/body/table/tr[3]/table/tr/td/table/tr").map do |node| 
        {:time=>node.children[0].text,:text=>node.children[1].text.gsub("\n","")}
      end
    end
    
    def address
      @page.links_with(:href=>/SearchDStatsSubmit\.php\?Address/).first.text.gsub(/-BC$/,"")
    end
    
    def incident_number
      xpath("/html/body/h3[1]").text.split(":").last.strip
    end
    
    def nature
      nature_cell_text.split("-").last
    end
    
    ResponseLevelMap = {"A"=>"Alpha",
                        "B"=>"Bravo",
                        "C"=>"Charlie",
                        "D"=>"Delta",
                        "E"=>"Echo",
                        "O"=>"Omega"}
    
    def response_level
      code = nature_cell_text.split("-").first
      if code == "IA"
        return "Bravo"
      elsif code =~ /^\d/
        match = code.scan(/^\d+([A-O])/).first.first
        ResponseLevelMap[match]
      else
        return "N/A"
      end
    end
    
    def apparatus
      xpath("/html/body/table/tr[1]/td[2]/table/tr/td[1]").map{|c| c.text.gsub("\n","").strip}
    end
    
    def pro_qa_notes
      notes.select{|n| n[:text] =~ /ProQA/}
    end
    
    def incidental_notes
      notes.select{|n| n[:text] =~ /^\s*\*/}
    end
    
    def spliced_notes
      s_notes = {}
      
      operator_notes = notes.select{|n| n[:text] =~ /[\(\[]\d+-\d+[\)\]]$/}
      splicing_notes = operator_notes + pro_qa_notes()
      splicing_notes.each do |note|
        token = "Pro QA"
        note_text = note[:text]
        if note[:text] =~ /[\(\[]\d+-\d+[\)\]]$/
          note_text_arr = note_text.split(/\s/)
          token = note_text_arr.delete_at(note_text_arr.size - 1)
          note_text = note_text_arr.join(" ")
        end
        
        if s_notes[token].nil?
          s_notes[token] = [{:time=>note[:time],:text=>note_text}]
        else
          s_notes[token] << {:time=>note[:time],:text=>note_text}
        end
      end
      
      s_notes
    end
    
    def cross_streets
      [cross_street_1,cross_street_2]
    end
    
    def cross_street_1
      if xpath_text("#{main_table_path}/tr[7]/th") == "Cross1"
        xpath_text("#{main_table_path}/tr[7]/td")
      elsif xpath_text("#{main_table_path}/tr[8]/th") == "Cross1"
        xpath_text("#{main_table_path}/tr[8]/td")
      end
    end
    
    def cross_street_2
      if xpath_text("#{main_table_path}/tr[8]/th") == "Cross2"
        xpath_text("#{main_table_path}/tr[8]/td")
      elsif xpath_text("#{main_table_path}/tr[9]/th") == "Cross2"
        xpath_text("#{main_table_path}/tr[9]/td")
      end
    end
    
    def priority
      xpath_text("#{main_table_path}/tr[4]/td[1]").to_i
    end
    
    def dispatch_code
      xpath_text("#{main_table_path}/tr[4]/td[2]")
    end
    
    def grid
      xpath_text("#{main_table_path}/tr[5]/td[1]")
    end
    
    def fire_area
      xpath_text("#{main_table_path}/tr[6]/td")
    end
    
    def time_of_alarm
      if is_prior_call?
        parse_time_at "#{main_table_path}/tr[16]/td"
      elsif is_active_call?
        parse_time_at "#{main_table_path}/tr[18]/td"
      end
    end
    
    def time_of_first_unit_on_scene
      if is_prior_call?
        parse_time_at "#{main_table_path}/tr[17]/td"
      elsif is_active_call?
        parse_time_at "#{main_table_path}/tr[19]/td"
      end
    end
  
    
  private
  
  
    def nature_cell_text
      if xpath_text("#{main_table_path}/tr[3]/th") == "Nature"
        xpath_text("#{main_table_path}/tr[3]/td")
      elsif xpath_text("#{main_table_path}/tr[4]/th") == "Nature"
        xpath_text("#{main_table_path}/tr[4]/td")
      end
    end
    
    def is_active_call?
      xpath_text("#{main_table_path}/tr[18]/th") == "Date Recd"
    end
    
    def is_prior_call?
      xpath_text("#{main_table_path}/tr[16]/th") == "Inc Date/Time"
    end
    
    def main_table_path
      "/html/body/table/tr[1]/td[1]/table"
    end
    
    def xpath(path)
      @page.parser.xpath(path)
    end

    def xpath_text(path)
      xpath(path).text.strip
    end
    
    def parse_time_at(path)
      time_string = xpath_text(path)
      DateTime.strptime time_string, "%m/%d/%Y %H:%M:%s"
    end
  end
end