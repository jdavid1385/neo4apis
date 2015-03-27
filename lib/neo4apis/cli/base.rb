module Neo4Apis
  module CLI
    class Base < ::Thor
      class_option :neo4j_url, type: :string,  default: 'http://localhost:7474'
      class_option :neo4j_username, type: :string
      class_option :neo4j_password, type: :string

      def neo4j_session
        Neo4j::Session.open(:server_db, options[:neo4j_url], basic_auth: {username: options[:neo4j_username], password: options[:neo4j_password]})
      end
    end
  end
end


