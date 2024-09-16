## Summary

| Name                                  | Offset   |   Length | Description                                     |
|:--------------------------------------|:---------|---------:|:------------------------------------------------|
| spiker_adapter.[`SPIKES_0`](#spikes)  | 0x0      |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_1`](#spikes)  | 0x4      |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_2`](#spikes)  | 0x8      |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_3`](#spikes)  | 0xc      |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_4`](#spikes)  | 0x10     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_5`](#spikes)  | 0x14     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_6`](#spikes)  | 0x18     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_7`](#spikes)  | 0x1c     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_8`](#spikes)  | 0x20     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_9`](#spikes)  | 0x24     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_10`](#spikes) | 0x28     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_11`](#spikes) | 0x2c     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_12`](#spikes) | 0x30     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_13`](#spikes) | 0x34     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_14`](#spikes) | 0x38     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_15`](#spikes) | 0x3c     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_16`](#spikes) | 0x40     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_17`](#spikes) | 0x44     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_18`](#spikes) | 0x48     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_19`](#spikes) | 0x4c     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_20`](#spikes) | 0x50     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_21`](#spikes) | 0x54     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_22`](#spikes) | 0x58     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_23`](#spikes) | 0x5c     |        4 | Subword of Spikes                               |
| spiker_adapter.[`SPIKES_24`](#spikes) | 0x60     |        4 | Subword of Spikes                               |
| spiker_adapter.[`CTRL1`](#ctrl1)      | 0x64     |        4 | Controls handshaking signal of the accelerator. |
| spiker_adapter.[`STATUS`](#status)    | 0x68     |        4 | Contains the current status of the accelerator. |

## SPIKES
Subword of Spikes
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name      | Offset   |
|:----------|:---------|
| SPIKES_0  | 0x0      |
| SPIKES_1  | 0x4      |
| SPIKES_2  | 0x8      |
| SPIKES_3  | 0xc      |
| SPIKES_4  | 0x10     |
| SPIKES_5  | 0x14     |
| SPIKES_6  | 0x18     |
| SPIKES_7  | 0x1c     |
| SPIKES_8  | 0x20     |
| SPIKES_9  | 0x24     |
| SPIKES_10 | 0x28     |
| SPIKES_11 | 0x2c     |
| SPIKES_12 | 0x30     |
| SPIKES_13 | 0x34     |
| SPIKES_14 | 0x38     |
| SPIKES_15 | 0x3c     |
| SPIKES_16 | 0x40     |
| SPIKES_17 | 0x44     |
| SPIKES_18 | 0x48     |
| SPIKES_19 | 0x4c     |
| SPIKES_20 | 0x50     |
| SPIKES_21 | 0x54     |
| SPIKES_22 | 0x58     |
| SPIKES_23 | 0x5c     |
| SPIKES_24 | 0x60     |


### Fields

```wavejson
{"reg": [{"name": "SPIKES", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   wo   |    x    | SPIKES |               |

## CTRL1
Controls handshaking signal of the accelerator.
- Offset: `0x64`
- Reset default: `0x0`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "SAMPLE_READY", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "SAMPLE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 140}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                           |
|:------:|:------:|:-------:|:-------------|:--------------------------------------|
|  31:2  |        |         |              | Reserved                              |
|   1    |   wo   |    x    | SAMPLE       | Notifies that the spikes are read.    |
|   0    |   wo   |    x    | SAMPLE_READY | Signals the presence of a new sample. |

## STATUS
Contains the current status of the accelerator.
- Offset: `0x68`
- Reset default: `0x0`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "CODE", "bits": 2, "attr": ["ro"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                  |
|:------:|:------:|:-------:|:----------------------|
|  31:2  |        |         | Reserved              |
|  1:0   |   ro   |    x    | [CODE](#status--code) |

### STATUS . CODE
The current status code of the accelerator.

| Value   | Name         | Description                                                                 |
|:--------|:-------------|:----------------------------------------------------------------------------|
| 0x0     | IDLE         | Accelerator is idle, results are avaialble for read.                        |
| 0x1     | PENDING      | Pending operation. Chaning configuration while pending results in an error. |
| 0x2     | ERROR_WRITE  | A configuration change was attempted during pending operation.              |
| 0x3     | ERROR_OPCODE | The accelerator was supplied with an unknown opcode.                        |


