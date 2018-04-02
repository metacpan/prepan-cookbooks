mackerel_credentials = data_bag_item('credentials', 'mackerel')
node.default['mackerel-agent']['conf']['apikey'] = mackerel_credentials['api_key']

include_recipe 'mackerel-agent'

