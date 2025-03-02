# class TodoList
#   attr_accessor :id, :task_item

#   @@id_counter = 0

#   def initialize(task_item)

#     @@id_counter += 1

#     @task_item = task_item
#     @id = @@id_counter
#   end

#   def to_s
#     "#{@id}. #{task_item}"
#   end
# end

# class TodoListManager
#   def initialize
#     @full_list = []
#   end

#   def add_task(task_item)
#     new_task = TodoList.new(task_item)
#     @full_list << new_task

#     puts "✅ Item added: #{new_task}"
#   end

#   def view_task_items
#     if @full_list == nil
#       puts "Nothing on the Todo List!"
#     else
#       for task in @full_list
#         puts task
#       end
#     end
#   end

#   def delete_item(id)
#     if @full_list.empty?
#       puts "Nothing on the Todo List!"
#     else
#       task_to_delete = @full_list.find { |task| task.id == id }
      
#       if task_to_delete
#         @full_list.reject! { |task| task.id == id }
#         puts "🗑️ Task #{id} deleted!"
#       else
#         puts "❌ No task found with ID: #{id}"
#       end
#     end
#   end  
# end

# class TodoListCLI
#   def initialize
#     @manager = TodoListManager.new
#   end

# def start

#   loop do

#   puts "Choose one of the below:
#   1> Add a task item to Todo
#   2> View all the Todo
#   3> Delete a task item
#   4> Exit"

#   response = gets.chomp.to_i

#   if response.between?(1,4)
    
#     if response == 1
      
#       puts "Enter your Todo below"
#       task_item = gets.chomp
#       @manager.add_task(task_item)

#     elsif response == 2
#       @manager.view_task_items

#     elsif response == 3

#       puts "Enter the Todo you want to delete"
#       del_item = gets.chomp
#       @manager.delete_item(del_item)
#     else 
#       puts "Cool, See you again!"
#       return
#     end
#   else
#     puts "There is no such option!"
#   end
# end
# end
# end

# TodoListCLI.new.start


class TodoList
  attr_accessor :id, :task_item

  @@id_counter = 0

  def initialize(task_item)
    @@id_counter += 1
    @task_item = task_item
    @id = @@id_counter
  end

  def to_s
    "#{@id}. #{@task_item}"
  end
end

class TodoListManager
  def initialize
    @full_list = []
  end

  def add_task(task_item)
    new_task = TodoList.new(task_item)
    @full_list << new_task
    puts "Item added: #{new_task}"
  end

  def view_task_items
    if @full_list.empty?
      puts "Nothing on the Todo List!"
    else
      @full_list.each { |task| puts task }
    end
  end

  def delete_item(id)
    id = id.to_i  # Ensure id is an integer
    if @full_list.empty?
      puts "Nothing on the Todo List!"
    else
      task_to_delete = @full_list.find { |task| task.id == id }
      
      if task_to_delete
        @full_list.reject! { |task| task.id == id }
        puts "Task #{id} deleted!"
      else
        puts "No task found with ID: #{id}"
      end
    end
  end
end

class TodoListCLI
  def initialize
    @manager = TodoListManager.new
  end

  def start
    loop do
      puts "Choose one of the below:
      1> Add a task item to Todo
      2> View all the Todo
      3> Delete a task item
      4> Exit"

      response = gets.chomp.to_i

      case response
      when 1
        puts "Enter your Todo below"
        task_item = gets.chomp
        @manager.add_task(task_item)
      when 2
        @manager.view_task_items
      when 3
        puts "Enter the Todo ID you want to delete"
        del_item = gets.chomp
        @manager.delete_item(del_item)
      when 4
        puts "Cool, See you again!"
        return
      else
        puts "There is no such option!"
      end
    end
  end
end

TodoListCLI.new.start
