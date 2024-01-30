
## Just-Interactions


Do you want to create innovative interactions? With our script it's possible. Add interactions on Entity, or on given Coordinates You can use it in any script, for example in the Pawn Shop or in the jobs. 

#### NoPixel like Textures created by https://github.com/Obtaizen
Without this guy we wouldn't have been able to create the NoPixel option in the config.

## Video Preview

[![Watch the video](https://cdn.discordapp.com/attachments/985607890100437063/1200452405855269025/JustInteractions.png?ex=65c63b6c&is=65b3c66c&hm=72524b8ee4f3c61b1404a89195dcb3e36db5a64bd1d3e731d6211d3dbf4f0537&)](https://www.youtube.com/watch?v=_-EccJg5jOk)



## FAQ

#### Can I use it in stores, for example?

Of course you can, most things are possible in this script

#### Will the script ever be updated?

Definitely yes, the current script is in the WIP stage, so we recommend reporting any problems on our discord : https://discord.gg/QVgbKSTHMz


## Usage/Examples

### On Coords
```lua
    exports['just_interactions']:createInteraction(
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
    exports['just_interactions']:createInteraction(
        {
            entity = yourEntity
            action = function ()
                --- Your Action
            end,
            label = 'Your Label',
        }
    )
```
### Using canInteract
```lua
    exports['just_interactions']:createInteraction(
        {
            entity = yourEntity
            action = function ()
                --- Your Action
            end,
            label = 'Your Label',
            canInteract = function()
                --- your logic must return true to show element and return false to hide element
            end,
        }
    )
```
### Using job
```lua
    exports['just_interactions']:createInteraction(
        {
            entity = yourEntity
            action = function ()
                --- Your Action
            end,
            label = 'Your Label',
            job = 'police'
        }
    )
```

### Remove Interaction on Coords
```lua
    exports['just_interactions']:removeInteraction({-324.62585449219, -1514.4627685547, 27.56467628479, 293.38525390625})
```

### Remove Interaction on Entity
```lua
exports['just_interactions']:removeEntity(yourEntity)
```


