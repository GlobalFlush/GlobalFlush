#UserSession is the session information for a user browsing the website
#Contains a hashed string of the login time and username
# - timestamp: the date of creation and update
class UserSession < Authlogic::Session::Base
  # hash the session into a key
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

end
