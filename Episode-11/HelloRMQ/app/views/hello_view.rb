class HelloView < UIView

  def rmq_build
    rmq.append(UILabel, :hello_label)
    rmq.append(UIButton, :hello_button).on(:tap) do |sender|
      rmq(:hello_label).animate(
        duration: 1,
        animations: -> (q) {
          q.style do |st|
            st.scale = 0.6
            st.view.alpha = 0.1
            st.top = st.top - 50
          end
        },
        completion: -> (did_finish, q) {
          q.animate(
            duration: 0.3,
            animations: -> (cq) {
              cq.style do |st|
                st.scale = 1
                st.view.alpha = 1
                st.top = st.top + 50
                st.text = (st.text == "Hello RMQ!" ? "Goodbye RMQ!" : "Hello RMQ!")
              end
            }
          )
        }
      )
    end
  end

end