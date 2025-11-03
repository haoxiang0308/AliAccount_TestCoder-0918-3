// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Add input mapping context
	if (APlayerController* PC = Cast<APlayerController>(GetController()))
	{
		if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PC->GetLocalPlayer()))
		{
			Subsystem->AddMappingContext(InputMappingContext, 0);
		}
	}
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	UEnhancedInputComponent* PlayerInputComponent = Cast<UEnhancedInputComponent>(InputComponent);
	if (!PlayerInputComponent) return;

	// Binding player input actions
	if (MoveForwardAction)
	{
		PlayerInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
	}

	if (MoveRightAction)
	{
		PlayerInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);
	}

	if (JumpAction)
	{
		PlayerInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);
	}

	if (FireAction)
	{
		PlayerInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &APlayerInputHandler::Fire);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	// Add forward movement logic here
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	// Add right movement logic here
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Add jump logic here
	// Example: ACharacter::Jump();
}

void APlayerInputHandler::Fire()
{
	// Add fire logic here
	// Example: Implement shooting functionality
}