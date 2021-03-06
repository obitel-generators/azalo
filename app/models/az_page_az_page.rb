class AzPageAzPage < ActiveRecord::Base
  belongs_to :az_parent_page, :class_name => 'AzPage', :foreign_key => :parent_page_id
  #belongs_to :page, :class_name => 'AzPage', :foreign_key => :page_id
  belongs_to :az_page, :class_name => 'AzPage', :foreign_key => :page_id

  #def before_destroy
    #puts "============================================================================================"
    #puts "page destroy 1 #{az_page.parents.size}"
    #if az_page.parents.size == 0
      #az_page.destroy
    #end
    #puts "============================================================================================"
  #end

  validates_uniqueness_of :page_id, :scope=>:parent_page_id

#  def validate_uniq_page_parent_page
#    # pair page and parent page should be uniq TODO add index to DB
#    link = AzPageAzPage.find(:first, :conditions => {:page_id => page_id, :parent_page_id=> parent_page_id})
#    if link
#      errors.add_to_base("Page can be connected to some parent only once")
#    end
#  end

  def before_create
    #TODO
    last = AzPageAzPage.find(:last)
    if last == nil
      self.position = 1
    else
      self.position = last.id + 1
    end
    
  end

  def before_destroy
#    puts az_page.parents.size
#    if az_parent_page.root && az_page.parents.size > 1
#      return false
#    end
#    return true
  end

  def after_destroy
    #puts "============================================================================================"
    #puts "page destroy 2 #{az_page.parents.size}"
    if az_page && az_page.parents.size == 0
      #puts "page #{az_page.name} destroyed"
      az_page.destroy
    end
    #puts "============================================================================================"
  end

  def self.from_az_hash(attributes, page_ids_original_copy)
    page_link = AzPageAzPage.new
    page_link.parent_page_id = page_ids_original_copy[attributes['parent_page_id']]
    page_link.page_id = page_ids_original_copy[attributes['page_id']]
    return page_link
  end

end
