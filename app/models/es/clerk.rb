class Es::Clerk < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  settings index: { number_of_shards: 10 ,number_of_replicas: 1, max_result_window: 200000} do
    mappings dynamic: 'false' do
      indexes :clerk_no, analyzer: 'ik_max_word',search_analyzer: "ik_max_word", index_options: 'offsets',type:'string'
      indexes :name, index_options: 'freqs', index:'not_analyzed',type:'keyword'
      indexes :email, index_options: 'freqs', index:'not_analyzed',type:'keyword'
      indexes :entry_time, index_options: 'freqs', index:'not_analyzed',type:'keyword'
      indexes :depart, index_options: 'freqs', index:'not_analyzed',type:'keyword'
      indexes :position, index_options: 'freqs', index:'not_analyzed',type:'keyword'
      indexes :is_leader, index_options: 'freqs', index:'not_analyzed',type:'keyword'
      indexes :sex, index_options: 'freqs', index:'not_analyzed',type:'keyword'
      indexes :salary, index_options: 'freqs', index:'not_analyzed',type:'float'
    end
  end	
end