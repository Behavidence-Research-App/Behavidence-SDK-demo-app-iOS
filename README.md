# Behavidence SDK - demo app     
Simple example of integration of Behavidence SDK into another application

## Requires SensorKit entitlement   

### Step 1 - set API Key    
``` 
BehavidenceSDK.SetApiKey(key: PRIVATE_API_KEY)
```    

### Step 2 - call setup SDK method
If setup succeeds, try fetching Mental Health Similarity Scores     
``` 
BehavidenceSDK.Setup { error, loggedIn in
    BehavidenceSDK.GetAllScores() { data in
        print("MHSS - OK")
    }
} 
```     
     
### Step 3 - launch data recording     
``` 
BehavidenceSDK.Refresh()
```     


