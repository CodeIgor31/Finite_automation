module VendingsHelper
  def process_event(current_state, event)
    a = 1
    b = 0
    c = 2
    transition_table = {
      ["q0", a] => "q1",
      ["q1", a] => "q2",
      ["q1", b] => "q0",
      ["q1", c] => "q1",
      ["q2", a] => "q3",
      ["q2", b] => "q2",
      ["q2", c] => "q4",
      ["q3", a] => "q4",
      ["q4", a] => "q0"
    }
    new_state = transition_table[[current_state, event]]
    p new_state
  end
end
