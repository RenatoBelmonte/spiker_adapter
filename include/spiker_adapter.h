// Generated register defines for spiker_adapter

#ifndef _SPIKER_ADAPTER_REG_DEFS_
#define _SPIKER_ADAPTER_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Register width
#define SPIKER_ADAPTER_PARAM_REG_WIDTH 32

// Subword of Spikes (common parameters)
#define SPIKER_ADAPTER_SPIKES_SPIKES_FIELD_WIDTH 32
#define SPIKER_ADAPTER_SPIKES_SPIKES_FIELDS_PER_REG 1
#define SPIKER_ADAPTER_SPIKES_MULTIREG_COUNT 25

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_0_REG_OFFSET 0x0

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_1_REG_OFFSET 0x4

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_2_REG_OFFSET 0x8

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_3_REG_OFFSET 0xc

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_4_REG_OFFSET 0x10

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_5_REG_OFFSET 0x14

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_6_REG_OFFSET 0x18

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_7_REG_OFFSET 0x1c

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_8_REG_OFFSET 0x20

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_9_REG_OFFSET 0x24

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_10_REG_OFFSET 0x28

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_11_REG_OFFSET 0x2c

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_12_REG_OFFSET 0x30

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_13_REG_OFFSET 0x34

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_14_REG_OFFSET 0x38

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_15_REG_OFFSET 0x3c

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_16_REG_OFFSET 0x40

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_17_REG_OFFSET 0x44

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_18_REG_OFFSET 0x48

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_19_REG_OFFSET 0x4c

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_20_REG_OFFSET 0x50

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_21_REG_OFFSET 0x54

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_22_REG_OFFSET 0x58

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_23_REG_OFFSET 0x5c

// Subword of Spikes
#define SPIKER_ADAPTER_SPIKES_24_REG_OFFSET 0x60

// Controls handshaking signal of the accelerator.
#define SPIKER_ADAPTER_CTRL1_REG_OFFSET 0x64
#define SPIKER_ADAPTER_CTRL1_SAMPLE_READY_BIT 0
#define SPIKER_ADAPTER_CTRL1_SAMPLE_BIT 1

// Contains the current status of the accelerator.
#define SPIKER_ADAPTER_STATUS_REG_OFFSET 0x68
#define SPIKER_ADAPTER_STATUS_CODE_MASK 0x3
#define SPIKER_ADAPTER_STATUS_CODE_OFFSET 0
#define SPIKER_ADAPTER_STATUS_CODE_FIELD \
  ((bitfield_field32_t) { .mask = SPIKER_ADAPTER_STATUS_CODE_MASK, .index = SPIKER_ADAPTER_STATUS_CODE_OFFSET })
#define SPIKER_ADAPTER_STATUS_CODE_VALUE_IDLE 0x0
#define SPIKER_ADAPTER_STATUS_CODE_VALUE_PENDING 0x1
#define SPIKER_ADAPTER_STATUS_CODE_VALUE_ERROR_WRITE 0x2
#define SPIKER_ADAPTER_STATUS_CODE_VALUE_ERROR_OPCODE 0x3

#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _SPIKER_ADAPTER_REG_DEFS_
// End generated register defines for spiker_adapter