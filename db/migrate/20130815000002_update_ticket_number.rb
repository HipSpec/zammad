class UpdateTicketNumber < ActiveRecord::Migration
  def up
    Setting.create_or_update(
      title: 'Ticket Number Format',
      name: 'ticket_number',
      area: 'Ticket::Number',
      description: 'Selects the ticket number generator module. "Increment" increments the ticket
     number, the SystemID and the counter are used with SystemID.Counter format (e.g. 1010138, 1010139).
     With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter.
     The format looks like Year.Month.Day.SystemID.counter (e.g. 201206231010138, 201206231010139).
     With param "Checksum => true" the counter will be appended as checksum to the string. The format 
     looks like SystemID.Counter.CheckSum (e. g. 10101384, 10101392) or Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2012070110101520, 2012070110101535).',
      options: {
        form: [
          {
            display: '',
            null: true,
            name: 'ticket_number', 
            tag: 'select',
            options: {
              'Ticket::Number::Increment' => 'Increment (SystemID.Counter)',
              'Ticket::Number::Date'      => 'Date (Year.Month.Day.SystemID.Counter)',
            },
          },
        ],
      },
      state: 'Ticket::Number::Increment',
      frontend: false
    )
  end
  def down
  end
end
