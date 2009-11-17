
module Ext
  class Form < Component

    attr_reader :fields 
    
	  def init_component()
   
	    # load all fields.
	    fields = @selenium.get_eval("window.Ext.getCmp('#{@id}').findBy(function(el) { return el.getXTypes().indexOf('/field/') != -1 }).map(function(el) { return el.getId() })");
      print fields
      @fields = {}
      fields.split(",").each do |field_id|
        field = @selenium.get_cmp(field_id, self);
        @fields[field.getName().to_sym] = field
        p field_id
      end
      print @fields
      
    end

    # component/box/field/textfield
    # window.Ext.ComponentMgr.all.find(function(el){ return el.getXType() == 'form' }).findBy(function(el) { console.debug(el.getXType()); })
  end
end