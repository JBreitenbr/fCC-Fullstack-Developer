# user configuration manager

test_settings = {
    'theme': 'dark', 
    'notifications': 'enabled', 
    'volume': 'high',
    #'emoji': 'medium'
}

def add_setting(dictionary, settings):
    key = settings[0].lower()
    value = settings[1].lower()
    if key in dictionary:
        return "Setting '" + key +  "' already exists! Cannot add a new setting with this name."
    else:
        dictionary[key] = value
        return "Setting '" + key + "' added with value '" + value + "' successfully!"

def update_setting(dictionary, settings):
    key = settings[0].lower()
    value = settings[1].lower()
    if key in dictionary:
        dictionary[key] = value
        return "Setting '" + key + "' updated to '" + value + "' successfully!"
    else:
        return "Setting '" + key + "' does not exist! Cannot update a non-existing setting."

def delete_setting(dictionary, setting):
    key = setting.lower()
    if key in dictionary:
        dictionary.pop(key)
        return "Setting '" + key + "' deleted successfully!"
    else:
        return "Setting not found!"

def view_settings(dictionary):
    if len(dictionary) == 0:
        return "No settings available."
    else:
        entries = ""
        for item in dictionary.items():
            entry = item[0].capitalize() + ": " + item[1] + "\n"
            entries += entry
        return "Current User Settings:\n" + entries
               
# add_setting(test_settings, ('EMOJI', 'SMALL'))

# update_setting(test_settings, ('EMOJI', 'SMALL'))

# delete_setting(test_settings, 'THEME')

view_settings(test_settings)

print(view_settings(test_settings))
