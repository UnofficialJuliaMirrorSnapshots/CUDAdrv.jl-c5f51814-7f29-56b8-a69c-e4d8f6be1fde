# API wrappers

This section lists the package's public functionality that directly corresponds to
functionality of the CUDA driver API. In general, the abstractions stay close to those of
the CUDA driver API, so for more information on certain library calls you can consult the
[CUDA driver API reference](http://docs.nvidia.com/cuda/cuda-driver-api/).

The documentation is grouped according to the modules of the driver API.


## Installation properties

```@docs
CUDAdrv.vendor
```


## Initialization

```@docs
CUDAdrv.init
```


## Error Handling

```@docs
CUDAdrv.CuError
CUDAdrv.name(::CuError)
CUDAdrv.description(::CuError)
```


## Version Management

```@docs
CUDAdrv.version()
```


## Device Management

```@docs
CUDAdrv.CuDevice
CUDAdrv.devices
CUDAdrv.name(::CuDevice)
CUDAdrv.totalmem(::CuDevice)
CUDAdrv.attribute
```

Certain common attributes are exposed by additional convenience functions:

```@docs
CUDAdrv.capability(::CuDevice)
CUDAdrv.warpsize(::CuDevice)
```


## Context Management

```@docs
CUDAdrv.CuContext
CUDAdrv.destroy!(::CuContext)
CUDAdrv.CuCurrentContext
CUDAdrv.activate(::CuContext)
CUDAdrv.synchronize(::CuContext)
CUDAdrv.device(::CuContext)
```

### Primary Context Management

```@docs
CUDAdrv.CuPrimaryContext
CUDAdrv.CuContext(::CuPrimaryContext)
CUDAdrv.isactive(::CuPrimaryContext)
CUDAdrv.flags(::CuPrimaryContext)
CUDAdrv.setflags!(::CuPrimaryContext, ::CUDAdrv.CUctx_flags)
CUDAdrv.unsafe_reset!(::CuPrimaryContext, ::Bool)
```


## Module Management

```@docs
CUDAdrv.CuModule
```

### Function Management

```@docs
CUDAdrv.CuFunction
```

### Global Variable Management

```@docs
CUDAdrv.CuGlobal
CUDAdrv.eltype(::CuGlobal)
CUDAdrv.get(::CuGlobal)
CUDAdrv.set{T}(::CuGlobal{T}, ::T)
```

### Linker

```@docs
CUDAdrv.CuLink
CUDAdrv.add_data!
CUDAdrv.add_file!
CUDAdrv.CuLinkImage
CUDAdrv.complete
CUDAdrv.CuModule(::CUDAdrv.CuLinkImage, args...)
```

## Memory Management

```@docs
CUDAdrv.Mem.alloc
CUDAdrv.Mem.free
CUDAdrv.Mem.set!
CUDAdrv.Mem.upload
CUDAdrv.Mem.upload!
CUDAdrv.Mem.download
CUDAdrv.Mem.download!
CUDAdrv.Mem.transfer
CUDAdrv.Mem.transfer!
```

### Memory info

```@docs
CUDAdrv.Mem.info
CUDAdrv.Mem.total
CUDAdrv.Mem.used
CUDAdrv.Mem.free()
```


## Stream Management

```@docs
CUDAdrv.CuStream
CUDAdrv.CuDefaultStream
CUDAdrv.synchronize(::CuStream)
```

## Event Management

```@docs
CUDAdrv.CuEvent
CUDAdrv.record
CUDAdrv.synchronize(::CuEvent)
CUDAdrv.elapsed
CUDAdrv.@elapsed
```

## Execution Control

```@docs
CUDAdrv.CuDim3
CUDAdrv.cudacall
CUDAdrv.launch
```

## Profiler Control

```@docs
CUDAdrv.@profile
CUDAdrv.Profile.start
CUDAdrv.Profile.stop
```
