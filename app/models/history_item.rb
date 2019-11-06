class HistoryItem < ApplicationRecord

	belongs_to :sales_history
	belongs_to :album

end
