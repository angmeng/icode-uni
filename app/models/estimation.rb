class Estimation < ActiveRecord::Base

	has_many :drawings
	# accepts_nested_attributes_for :estimation , allow_destroy => true

	has_many :materials
	has_many :estimation_item

	belongs_to :station
	belongs_to :client

	#validates :welding , :oxygen_acetylene , :painting , :sand_blasting , :transport ,:crane ,:shipment,:labour,:installation,:dismantle,:machining,:insulation,:civil_work,:electrik,:piling_work,:forming,:misc,:jkkp , numericality: true



	validates :title , :dimension , :date,  presence: :true


end
