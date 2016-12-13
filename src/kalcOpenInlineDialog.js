(function( $, undefined ) {
  /**
   * KAL Consultancy Ltd - KALC Open Inline Dialog - provided under the MIT license
   * 
   * Contact: kalconsultancyltd@hotmail.com
   * @version 1.0
   * Tested on Oracle Application Express 5.0.4 and Universal Theme
   *
   * @license
   * Copyright (c) 2016 KAL Consultancy Ltd
   *
   * Permission is hereby granted, free of charge, to any person obtaining a copy
   * of this software and associated documentation files (the "Software"), to deal
   * in the Software without restriction, including without limitation the rights
   * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   * copies of the Software, and to permit persons to whom the Software is
   * furnished to do so, subject to the following conditions:
   *
   * The above copyright notice and this permission notice shall be included in all
   * copies or substantial portions of the Software.
   *
   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   * SOFTWARE.
   */

  kalcOpenInlineDialog = function(){
    var kalcDA                = this;
    var inlineDialogId        = kalcDA.action.attribute01;
    var inlineDialogTitle     = apex.item(kalcDA.action.attribute02).getValue();
    var dynamicDimensions     = kalcDA.action.attribute03;
    var newWidth, newHeight;
    var modalOrNot            = kalcDA.action.attribute08;
    var modalBool             = true;
    var positionDialog        = kalcDA.action.attribute09;
    var positionMy            = kalcDA.action.attribute10;
    var positionMyOffset      = kalcDA.action.attribute11;
    var positionAt            = kalcDA.action.attribute12;
    var positionAtOffset      = kalcDA.action.attribute13;
    var positionOf            = kalcDA.action.attribute14;

    var debugLevel            = apex.debug.getLevel();
    
    // Size the inline dialog
    if(dynamicDimensions=='Y'){
      if(debugLevel>3){
        apex.debug.info('Inline Dialog ID :'+inlineDialogId+': width item :'+kalcDA.action.attribute06+': height item :'+kalcDA.action.attribute07+':');
      }
      newWidth  = parseInt(apex.item(kalcDA.action.attribute06).getValue());
      newHeight = parseInt(apex.item(kalcDA.action.attribute07).getValue());
    } else {
      newWidth  = parseInt(kalcDA.action.attribute04);
      newHeight = parseInt(kalcDA.action.attribute05);
    }
    if(debugLevel>3){
      apex.debug.info('Inline Dialog ID :'+inlineDialogId+': width :'+newWidth+': height :'+newHeight+':');
    }
    $('#'+inlineDialogId).dialog({width: newWidth, height: newHeight});

    // Set the title if we have one
    if(inlineDialogTitle!=undefined&&inlineDialogTitle!=''){
      $('#'+inlineDialogId).dialog({title: inlineDialogTitle});
      if(debugLevel>3){
        apex.debug.info('Inline Dialog ID :'+inlineDialogId+': Title Item :'+kalcDA.action.attribute02+': Value :'+inlineDialogTitle+':');
      }
    }

    // set the modal property
    if(modalOrNot=='false'){
      modalBool = false;
    }
    $('#'+inlineDialogId).dialog({modal: modalBool});

    if(positionDialog&&positionDialog=='Y'){
      var posMyOffsetHorizontal, posMyOffsetVertical, posAtOffsetHorizontal, posAtOffsetVertical, newPositionMy, newPositionAt;
      
      if(positionMyOffset!=undefined&&positionMyOffset!=''){
        if(positionMyOffset.indexOf(' ')>-1){
          
          posMyOffsetHorizontal = positionMyOffset.substr(0,positionMyOffset.indexOf(' '));
          if(posMyOffsetHorizontal.substr(0,1)!='-'){
            posMyOffsetHorizontal = '+'+posMyOffsetHorizontal;
          }
          
          posMyOffsetVertical   = positionMyOffset.slice(positionMyOffset.indexOf(' ')+1);
          if(posMyOffsetVertical.substr(0,1)!='-'){
            posMyOffsetVertical = '+'+posMyOffsetVertical;
          }
          
        } else {
          if(positionMyOffset.substr(0,1)!='-'){
            posMyOffsetHorizontal = '+'+positionMyOffset;
            posMyOffsetVertical   = '+'+positionMyOffset;
          } else {
            posMyOffsetHorizontal = positionMyOffset;
            posMyOffsetVertical   = positionMyOffset;
          }
        }
        newPositionMy = positionMy.substr(0,positionMy.indexOf(' '))+posMyOffsetHorizontal+' '+positionMy.slice(positionMy.indexOf(' ')+1)+posMyOffsetVertical;
      } else {
        newPositionMy = positionMy;
      }
      
      if(positionAtOffset!=undefined&&positionAtOffset!=''){
        if(positionAtOffset.indexOf(' ')>-1){
          
          posAtOffsetHorizontal = positionAtOffset.substr(0,positionAtOffset.indexOf(' '));
          if(posAtOffsetHorizontal.substr(0,1)!='-'){
            posAtOffsetHorizontal = '+'+posAtOffsetHorizontal;
          }
          
          posAtOffsetVertical   = positionAtOffset.slice(positionAtOffset.indexOf(' ')+1);
          if(posAtOffsetVertical.substr(0,1)!='-'){
            posAtOffsetVertical = '+'+posAtOffsetVertical;
          }
          
        } else {
          if(positionAtOffset.substr(0,1)!='-'){
            posAtOffsetHorizontal = '+'+positionAtOffset;
            posAtOffsetVertical   = '+'+positionAtOffset;
          } else {
            posAtOffsetHorizontal = positionAtOffset;
            posAtOffsetVertical   = positionAtOffset;
          }
        }
        newPositionAt = positionAt.substr(0,positionAt.indexOf(' '))+posAtOffsetHorizontal+' '+positionAt.slice(positionAt.indexOf(' ')+1)+posAtOffsetVertical;
      } else {
        newPositionAt = positionAt;
      }

      if(debugLevel>3){
        apex.debug.info('Inline Dialog ID :'+inlineDialogId+': Position My :'+newPositionMy+':');
        apex.debug.info('Inline Dialog ID :'+inlineDialogId+': Position At :'+newPositionAt+':');
        apex.debug.info('Inline Dialog ID :'+inlineDialogId+': Position Of :'+positionOf+':');
      }
      
      // Can now position the dialog IF the "Of" selector exists
      if($(positionOf).length){
        $('#'+inlineDialogId).dialog({position: {my: newPositionMy, at: newPositionAt, of: positionOf} });
      } else {
        if(debugLevel>3){
          apex.debug.info('Inline Dialog ID :'+inlineDialogId+': Position Of :'+positionOf+': does not exist in the DOM');
        }
      }
    }

    // Finally, open the inline dialog
    $('#'+inlineDialogId).dialog('open');
  }

})( apex.jQuery );
