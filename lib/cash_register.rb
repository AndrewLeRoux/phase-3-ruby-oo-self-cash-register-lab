class CashRegister
    attr_accessor :total, :discount, :item_arr, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item_arr = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        @total += @last_transaction
        quantity.times do
            @item_arr << title
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = (@total * (1 - @discount * 0.01)).to_i
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @item_arr
    end

    def void_last_transaction
        @total -= @last_transaction
    end

end


cash_register = CashRegister.new(20)
cash_register.add_item("macbook air", 1000)
p cash_register.apply_discount
