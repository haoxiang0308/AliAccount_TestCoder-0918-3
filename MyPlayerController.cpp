// MyPlayerController.cpp
#include "MyPlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/PlayerInput.h"
#include "Components/InputComponent.h"
#include "Engine/World.h"

AMyPlayerController::AMyPlayerController()
{
    // Enable ticking
    PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    if (UInputComponent* PlayerInputComponent = Cast<UInputComponent>(InputComponent))
    {
        // Bind action events
        PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
        PlayerInputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::StopJumping);

        // Bind axis events
        PlayerInputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
        PlayerInputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
    }
}

void AMyPlayerController::Jump()
{
    if (APawn* MyPawn = GetPawn())
    {
        MyPawn->Jump();
    }
}

void AMyPlayerController::StopJumping()
{
    if (APawn* MyPawn = GetPawn())
    {
        MyPawn->StopJumping();
    }
}

void AMyPlayerController::MoveForward(float Value)
{
    if (Value != 0.0f && GetPawn() != nullptr)
    {
        GetPawn()->AddMovementInput(GetPawn()->GetActorForwardVector(), Value);
    }
}

void AMyPlayerController::MoveRight(float Value)
{
    if (Value != 0.0f && GetPawn() != nullptr)
    {
        GetPawn()->AddMovementInput(GetPawn()->GetActorRightVector(), Value);
    }
}