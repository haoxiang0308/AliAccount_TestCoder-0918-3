// Fill out your copyright notice in the Description page of Project Settings.

#include "MyPlayerController.h"


AMyPlayerController::AMyPlayerController()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement events
	PlayerInputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);

	// Bind action events
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
	PlayerInputComponent->BindAction("Fire", IE_Pressed, this, &AMyPlayerController::Fire);
}

void AMyPlayerController::MoveForward(float Value)
{
	// Add forward movement logic here
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	// Add right movement logic here
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void AMyPlayerController::Jump()
{
	// Add jump logic here
	// Example: ACharacter* Character = Cast<ACharacter>(GetPawn()); if (Character) { Character->Jump(); }
}

void AMyPlayerController::Fire()
{
	// Add fire logic here
}