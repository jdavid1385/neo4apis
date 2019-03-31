module Neo4Apis
  module CLI
    class Base < ::Thor
      option :neo4j_url, type: :string, default: 'http://localhost:7474'
      option :neo4j_username, type: :string
      option :neo4j_password, type: :string

      no_commands do
        def specified_neo4j_session
	  require 'neo4j/core/cypher_session/adaptors/http'
	  neo4j_adaptor = Neo4j::Core::CypherSession::Adaptors::HTTP.new("http://neo4j:test@localhost:17474")
	  Neo4j::ActiveBase.on_establish_session { Neo4j::Core::CypherSession.new(neo4j_adaptor) }
          # Neo4j::Session.open(:server_db, options[:neo4j_url], basic_auth: {username: options[:neo4j_username], password: options[:neo4j_password]})
	  Neo4j::ActiveBase.current_session = Neo4j::Core::CypherSession.new(neo4j_adaptor)
        end
      end
    end
  end
end


