module VendingsHelper
  def process_event(current_state, event)
    a = 1
    b = 0
    c = 2
    transition_table = {
      ["q0", a] => "q1", #rdy
      ["q1", a] => "q2", #rdy
      ["q1", c] => "q1", #rdy
      ["q2", a] => "q3", #rdy
      ["q2", b] => "q2", #rdy
      ["q2", c] => "q4", #rdy
      ["q3", a] => "q4", #rdy
      ["q4", a] => "q0"  #rdy
    }
    new_state = transition_table[[current_state, event]]
  end
end
