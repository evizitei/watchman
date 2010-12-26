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
      match = nature_cell_text.split("-").first.scan(/^\d+([A-O])/).first.first
      ResponseLevelMap[match]
    end
    
    def apparatus
      xpath("/html/body/table/tr[1]/td[2]/table/tr/td[1]").map{|c| c.text.gsub("\n","").strip}
    end
    
    def pro_qa_notes
      notes.select{|n| n[:text] =~ /^ProQA/}
    end
    
    def incidental_notes
      notes.select{|n| n[:text] =~ /^\s*\*/}
    end
    
    def spliced_notes
      s_notes = {}
      notes.select{|n| n[:text] =~ /[\(\[]\d+-\d+[\)\]]$/}.each do |note|
        note_text = note[:text]
        note_text_arr = note_text.split(/\s/)
        token = note_text_arr.delete_at(note_text_arr.size - 1)
        final_text = note_text_arr.join(" ")
        if s_notes[token].nil?
          s_notes[token] = [{:time=>note[:time],:text=>final_text}]
        else
          s_notes[token] << {:time=>note[:time],:text=>final_text}
        end
      end
      s_notes
    end
    
    def cross_streets
      [cross_street_1,cross_street_2]
    end
    
    def cross_street_1
      xpath_text("#{main_table_path}/tr[7]/td")
    end
    
    def cross_street_2
      xpath_text("#{main_table_path}/tr[8]/td")
    end
    
    def priority
      xpath_text("#{main_table_path}/tr[4]/td[1]").to_i
    end
    
    def dispatch_code
      xpath_text("#{main_table_path}/tr[4]/td[2]")
    end
  private
    def nature_cell_text
      xpath_text("#{main_table_path}/tr[3]/td")
    end
    
    def main_table_path
      "/html/body/table/tr[1]/td[1]/table"
    end
    
    def xpath_text(path)
      xpath(path).text.strip
    end
    
    def xpath(path)
      @page.parser.xpath(path)
    end
  end
end