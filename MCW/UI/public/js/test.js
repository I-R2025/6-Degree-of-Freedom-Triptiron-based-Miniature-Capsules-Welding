function enforceMinMax(value, inputElement)
{
    let max= parseFloat(inputElement.max)
    let min= parseFloat(inputElement.min)

   
          if(value < min){
            value= min;
            alert("Value exceeds the min allowed value of " + min);
          }
        
          else if(value > max){
            value= max;
            alert("Value exceeds the max allowed value of " + input.min);
          }
          return value;
        }   



document.addEventListener("DOMContentLoaded", function(){
    const inputElement=document.getElementById("fPosx");

inputElement.addEventListener("input",function (){
        validateInput(inputElement);
    });
    inputElement.addEventListener("wheel",function(e){
        let iput=e.target;
        let CurrentValue =parseFloat(input.value);
        let step = parseFloat(input.step);
        let delta = e.deltaY > 0?-step:step;

        let newValue = CurrentValue+delta;
        newValue = enforceMinMax(newValue, input);
        input.value = newValue.toFixed(2);
        e.preventDefault();

    })

    function validateInput(input){
          let value = parseFloat(input.value);
          let validateValue  = enforceMinMax(value, input);
                   input.value= validateValue;}
    });
        
    Input value= enforceMinMax(input value, document.getElementById("fPosx"));
    vueApp.fPosx = inputValue.toFixed(2);
    pos_request = document.getElementById(fPosx).value