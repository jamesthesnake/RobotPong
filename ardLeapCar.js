var Cylon = require('cylon'),
    LeapFrame= require('./ardLeapCarFrame.js');

Cylon.robot({
	connections: {
	    leapmotion : { adapator : 'leapmotion' },
	    arduino: { adaptor: 'firmata', port: '/dev/cu.usbmodem1411'  }
	},
           
	    devices: {
	    leapmotion: {driver: 'leapmotion' , connection: 'leapmotion'},
	    pin: { driver: 'direct-pin', pin: 3 , connection:'arduino' }, // right
		pin10: { driver: 'direct-pin', pin: 4, connection:'arduino'}, // backward
		pin11: {driver: 'direct-pin', pin:5, connection:'arduino'}, // forward doesnt work
		pin12: {driver: 'direct-pin', pin:6, connection:'arduino'} //left

	    //    button: { driver: 'button', pin: 5 }

	},
	    up  :function(my){
            var value=0;
	    
	    //		    frame= new LeapFrame(data);
	    // if(frame.hands.length>0 && frame.valid){
		            ever((1).second(), function(){
		    my.pin.digitalWrite(value);
		    value= (value == 0)? 1 : 0;
		
				});
	},
	    
    
	    down :function(my){
            var value=0;
            ever((1).second(), function(){
		    my.pin10.digitalWrite(value);
		    value= (value == 0)? 1 : 0;
		});
	},
	    right: function(my) {
	    var value = 0;
	    every((1).second(), function() {
		      
		    my.pin11.digitalWrite(value);
		    value = (value == 0) ? 1 : 0;
		});
	},
	    left : function(my){
	    var value=0;
	    ever((1).second(), function(){
		    my.pin12.digitalWrite(value);
		    value= (value == 0) ? 1 : 0;
		});
       
	}
    }).start();