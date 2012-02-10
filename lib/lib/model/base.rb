module Model

  class Base

    # ex:
    #   has_many :talks, :meetings
    def self.has_many(*assocs)
      assocs.each do |assoc|
        singular = assoc.to_s.gsub(/s$/,'')

        module_eval <<-"END"
          def #{assoc}
            @#{assoc} ||= []
          end

          def add_#{singular}(e)
            #{assoc} << e
          end

          def remove_#{singular}(e)
            #{assoc}.delete(e)
          end
        END
      end
    end
  end

end