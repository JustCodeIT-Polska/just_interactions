
## Just-Interactions


Do you want to create innovative interactions? With our script it's possible. Add interactions on Entity, or on given Coordinates You can use it in any script, for example in the Pawn Shop or in the jobs. 


## Video Preview

[![Watch the video](https://i.stack.imgur.com/Vp2cE.png)](https://youtu.be/vt5fpE0bzSY)



## FAQ

#### Can I use it in stores, for example?

Of course you can, most things are possible in this script

#### Will the script ever be updated?

Definitely yes, the current script is in the WIP stage, so we recommend reporting any problems on our discord : https://discord.gg/QVgbKSTHMz


## Usage/Examples

### On Coords
```lua
    exports['shx_interactions']:createInteraction(
        {
            coords = {-324.62585449219, -1514.4627685547, 27.56467628479, 293.38525390625},
            action = function ()
                --- Your Action
            end,
            label = 'Your Label',
        }
    )
```
### On Entity
```lua
    exports['shx_interactions']:createInteraction(
        {
            entity = yourEntity
            action = function ()
                --- Your Action
            end,
            label = 'Your Label',
        }
    )
```

### Remove Interaction on Coords
```lua
    exports['shx_interactions']:removeInteraction({-324.62585449219, -1514.4627685547, 27.56467628479, 293.38525390625})
```

### Remove Interaction on Entity
```lua
exports['shx_interactions']:removeEntity(yourEntity)
```


