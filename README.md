
# ASCON128 Encryption System Project

This repository contains the implementation of the ASCON128 encryption algorithm, a simplified authenticated encryption with associated data (AEAD) system. The project was carried out as part of the Digital Systems Design course.

## Author

- Gevorg ISHKHANYAN

## Date

- September 15, 2024

## Project Overview

ASCON128 is an authenticated encryption algorithm that ensures both the confidentiality and authenticity of data by encrypting message content while leaving the header in plaintext. This project aims to design and implement key components of the ASCON128 encryption system using **SystemVerilog** and simulate them with **ModelSim**.

### Key Concepts:

- **Authenticated Encryption with Associated Data (AEAD)**: A security protocol that encrypts message data while leaving headers, such as IP addresses, unencrypted.
- **ASCON128 Algorithm**: A cryptographic scheme that uses 320-bit states, where the plaintext is transformed into ciphertext through rounds of permutation and XOR operations.

## Project Components

### 1. **Constant Addition**
   - Adds round constants to the state register `x2` in each round of permutation.

### 2. **Substitution Layer**
   - Applies parallel substitution using an S-box table to modify the state based on 64 columns of data.

### 3. **Diffusion Layer**
   - Diffuses the state values by combining data from multiple columns.

### 4. **Permutation**
   - Performs 6 or 12 rounds of state transformation by applying constant addition, substitution, and diffusion in sequence.
   - The permutation steps are the heart of the ASCON encryption process.

### 5. **XOR and Registers**
   - XOR operations are used to combine the key, plaintext, and associated data during the initialization, encryption, and finalization phases.

### 6. **Finite State Machine (FSM)**
   - The FSM handles the overall control flow of the encryption process, including the initialization, processing of associated data, encryption of the plaintext, and finalization.

## Work Organization

The project files are organized into the following structure:
- `SRC/RTL/`: Source code for the ASCON components.
- `SRC/BENCH/`: Testbenches for simulating the ASCON system.
- `LIB/`: Contains compiled libraries and other related files.
- `compil_ascon.txt`: The compilation script for ModelSim.

### Compilation and Simulation

To compile and simulate the system:
1. Navigate to the project folder in **ModelSim**.
2. Run the following commands in the terminal:

```bash
cd /path/to/ASCON
source compil_ascon.txt
```

3. Uncomment the relevant testbench in the compilation script to simulate specific modules.

## Conclusion

The ASCON128 project was a challenging yet rewarding experience. While the full FSM implementation was not completed, the core encryption components, including the permutation and XOR operations, were successfully designed and verified through simulation. Future work will focus on completing the FSM and exploring performance optimization techniques.

## Resources

1. ASCON Algorithm Reference: [ASCON on Medium](https://medium.com/asecuritysite-when-bob-met-alice/ascon-rust-and-aead-b237afb78a83)
2. Processor Architecture Reference: [Von Neumann Architecture](https://www.quora.com/Which-is-the-most-commonly-used-computer-architecture-von-Neumann-or-Harvard-architecture-and-why)
