let vueApp = new Vue({
    el: "#vueApp",
    data: {
        // ros connection
        ros: new ROSLIB.Ros({
            url: 'ws://localhost:9090'
        }),
        rosbridge_address: 'ws://localhost:9090', 
        xFine:0,
        yFine:0,
        zFine:0,
        OverlapWheel:0,
        RPMWheel:0,
        fPosx:0,
        fPosy:0,
        fPosz:0,
        fOrientation:0,
        fRotation:0,
        position_x:0,

    },
    
    methods: {
      test : function (){

      }
	
    },
    
    mounted() {
        // page is ready
        // console.log('page is ready!')

        // // define ROSBridge connection object
        // this.ros = new ROSLIB.Ros({
        //     url: this.rosbridge_address
        // })

        // // define callbacks
        // this.ros.on('connection', () => {
        //     console.log('Connection to ROSBridge established!')
        // })
        // this.ros.on('error', (error) => {
        //     console.log('Something went wrong when trying to connect')
        //     console.log(error)
        // })
        // this.ros.on('close', () => {
        //     console.log('Connection to ROSBridge was closed!')
        // })

        
    },
})