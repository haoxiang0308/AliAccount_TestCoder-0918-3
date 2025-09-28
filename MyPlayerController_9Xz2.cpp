// Copyright Epic Games, Inc. All Rights Reserved.

#include "MyPlayerController_9Xz2.h"
#include "Engine/World.h"


AMyPlayerController_9Xz2::AMyPlayerController_9Xz2()
{
	// Enable ticking
	PrimaryActorTick.bCanEverTick = true;
}


void AMyPlayerController_9Xz2::SetupInputComponent()
{
	// Call the base class implementation
	Super::SetupInputComponent();

	// Bind input axis
	if (InputComponent)
	{
		InputComponent->BindAxis("MoveForward", this, &AMyPlayerController_9Xz2::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &AMyPlayerController_9Xz2::MoveRight);
		InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController_9Xz2::Jump);
		InputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController_9Xz2::StopJumping);
	}
}

void AMyPlayerController_9Xz2::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement input in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AMyPlayerController_9Xz2::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement input in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void AMyPlayerController_9Xz2::Jump()
{
	// Handle jump start
	bPressedJump = true;
}

void AMyPlayerController_9Xz2::StopJumping()
{
	// Handle jump stop
	bPressedJump = false;
}

void AMyPlayerController_9Xz2::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

	// Add any custom tick logic here
}