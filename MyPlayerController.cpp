// Fill out your copyright notice in the Description page of Project Settings.

#include "MyPlayerController.h"

AMyPlayerController::AMyPlayerController()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement events
	PlayerInputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);

	// Bind action events
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
	PlayerInputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::StopJumping);
}

void AMyPlayerController::MoveForward(float Value)
{
	// Add forward movement logic here
	if (Value != 0.0f)
	{
		// Example: AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	// Add right movement logic here
	if (Value != 0.0f)
	{
		// Example: AddMovementInput(GetActorRightVector(), Value);
	}
}

void AMyPlayerController::Jump()
{
	// Add jump start logic here
	bPressedJump = true;
}

void AMyPlayerController::StopJumping()
{
	// Add jump stop logic here
	bPressedJump = false;
}