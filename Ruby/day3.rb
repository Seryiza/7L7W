module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        attr_accessor :headers, :csv_contents

        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end

        def initialize
            read
        end

        def each(&block)
            @csv_contents.each {|csv_content| block.call CsvRow.new(@headers, csv_content)}
        end
    end

    class CsvRow
        attr_accessor :headers, :csv_content

        def initialize headers, csv_content
            @headers = headers
            @csv_content = csv_content
        end

        def method_missing(name)
            @csv_content[@headers.index(name.to_s)]
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}
