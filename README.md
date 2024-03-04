# skPubSub
Library that implements a simple publish/subscribe model in LiveCode  
Example usage/test stack can be found at https://forums.livecode.com/viewtopic.php?f=7&t=38948&p=228512#p228509

### About publish/subscribe
In the Publish/Subscribe model, any handler can ‘Publish’ a message - ie. emit a message blindly, without knowing who will receive this and what will happen. One or more objects can ‘subscribe’ to this message and perform 1 or more actions when received, without the publisher knowing who the subscriber is, or the subscriber knowing who the publisher is (aka ‘loose coupling’). 

Publishers post messages to an intermediary message broker (in this case a library loaded into the backScripts to be available in any context), and subscribers register subscriptions with that broker which logs the long id of the subscriber and which handler the subscriber should call (the ‘callback’ handler). A subscriber can register multiple callbacks for a message and can subscribe to multiple messages. 

### The library
The attached scriptOnlyStack is loaded by using ‘start using stack…”. The stack’s script loads it into the backScripts making it available in any context. 

Andre Garzia published a book on advanced app architecture for LiveCode which bundled a simple stack that does this. While I had long ago purchased his eBook I couldn’t for the life of me locate the stack, so I have tried to re-created his script (more or less successfully) - any kudos should go to him, any blame with this should be directed at me! 
(The book is well worth reading and highly recommended). 

### API
**subscribe** pEvent, pCallback, pTarget  
•	pEvent is the message to subscribe to  
•	pCallback is the hander the subscriber will run when the message is received  
•	pTarget is the long id of the subscriber  
  
**broadcast** pEvent, pData  
•	pEvent is the message to broadcast  
•	pData are the parameters for the callback handler  
  
**unsubscribe** pEvent, pCallback, pTarget  
•	pEvent is the message to unsubscribe from  
•	pCallback is the callback to remove  
•	pTarget is the long id of the subscriber to unsubscribe   
This allows specific callbacks to be removed without wholly unsuscribing; if not callback specified all are removed.  
  
**removeAllSubscriptions**   
All subscriptions for all controls are removed.
