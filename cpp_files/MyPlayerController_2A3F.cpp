// Fill out your copyright notice in the Description page of Project Settings.

#include "MyPlayerController_2A3F.h"

AMyPlayerController_2A3F::AMyPlayerController_2A3F()
{
}

void AMyPlayerController_2A3F::SetupInputComponent()
{
    Super::SetupInputComponent();

    if (InputComponent)
    {
        InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController_2A3F::Jump);
        InputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController_2A3F::StopJumping);

        InputComponent->BindAxis("MoveForward", this, &AMyPlayerController_2A3F::MoveForward);
        InputComponent->BindAxis("MoveRight", this, &AMyPlayerController_2A3F::MoveRight);
    }
}

void AMyPlayerController_2A3F::Jump()
{
    // Add jump logic here
}

void AMyPlayerController_2A3F::StopJumping()
{
    // Add stop jumping logic here
}

void AMyPlayerController_2A3F::MoveForward(float Value)
{
    // Add forward movement logic here
}

void AMyPlayerController_2A3F::MoveRight(float Value)
{
    // Add right movement logic here
}