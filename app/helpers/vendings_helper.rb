module VendingsHelper
  def process_event(current_state, event)
    transition_table = {
      ["q0", 2] => ["q1", "Отображение на экране меню"], 
      ["q1", 3] => ["q1", "Повтор"], 
      ["q1", 1] => ["q2", "Отображение на экране меню"], 
      ["q2", 0] => ["q3", "Получение товара"], 
      ["q2", 2] => ["q4", "Получение денег"], 
      ["q2", 4] => ["q2", "Повтор"], 
      ["q3", 2] => ["q4", "Получение денег"], 
      ["q4", 2] => ["q0", "Отображение на экране меню"]  
    }
    new_state = transition_table[[current_state, event]]
  end
end
