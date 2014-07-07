require 'pdf-reader'

class PDFRename


  def rename_pdf_by_form_id(directory)
    Dir.entries(directory).each do |pdf|
      if pdf.match(/.pdf$/i)
        reader = PDF::Reader.new("#{directory}#{pdf}")
        #puts reader.info
        content=""
        reader.pages.each do |page|
          #puts page.text
          content+=page.text
        end
        a=content.split("\n")
        a.each do |line|

          if line.include?("TL-DUNWI")
            id=line.split(" I")
            puts id
            puts id.length
            newname=id[1].to_s.strip+".pdf"
            basename= File.basename(pdf, File.extname(pdf))
            basename.strip!
            puts newname
            File.rename("#{directory}#{pdf}", "#{directory}#{newname}")
          end


        end


      end

    end
  end
end

#Calling PDFRename
RENAME = PDFRename.new
RENAME.rename_pdf_by_form_id "C:\\Users\\Adib\\Downloads\\"