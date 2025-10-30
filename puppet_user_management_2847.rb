class Puppet
  def initialize
    @users = {}
  end

  def create_user(username, password = nil, groups = [])
    if @users.key?(username)
      puts "Usuario #{username} ya existe"
      return false
    end
    
    @users[username] = {
      password: password,
      groups: groups,
      created_at: Time.now
    }
    
    puts "Usuario #{username} creado exitosamente"
    true
  end

  def delete_user(username)
    if @users.key?(username)
      @users.delete(username)
      puts "Usuario #{username} eliminado exitosamente"
      true
    else
      puts "Usuario #{username} no encontrado"
      false
    end
  end

  def list_users
    puts "Usuarios del sistema:"
    @users.each_key do |username|
      puts "- #{username}"
    end
  end

  def user_exists?(username)
    @users.key?(username)
  end

  def add_user_to_group(username, group)
    if @users.key?(username)
      @users[username][:groups] << group unless @users[username][:groups].include?(group)
      puts "Usuario #{username} agregado al grupo #{group}"
      true
    else
      puts "Usuario #{username} no encontrado"
      false
    end
  end

  def get_user_info(username)
    if @users.key?(username)
      user_info = @users[username]
      puts "Información del usuario #{username}:"
      puts "  Fecha de creación: #{user_info[:created_at]}"
      puts "  Grupos: #{user_info[:groups].join(', ')}"
      true
    else
      puts "Usuario #{username} no encontrado"
      false
    end
  end
end

# Ejemplo de uso:
# puppet = Puppet.new
# puppet.create_user("juan", "password123", ["sudo", "users"])
# puppet.list_users
# puppet.get_user_info("juan")
# puppet.add_user_to_group("juan", "developers")