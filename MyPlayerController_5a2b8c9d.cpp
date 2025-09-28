#include "MyPlayerController.h"
#include "GameFramework/InputSettings.h"

void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Bind actions defined in Project Settings -> Input
    if (InputComponent)
    {
        InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
        InputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::StopJumping);

        InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
        InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
    }
}

void AMyPlayerController::Jump()
{
    // Handle jump input
    if (APawn* const Pawn = GetPawn())
    {
        Pawn->Jump();
    }
}

void AMyPlayerController::StopJumping()
{
    // Handle stop jumping input
    if (APawn* const Pawn = GetPawn())
    {
        Pawn->StopJumping();
    }
}

void AMyPlayerController::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Add forward movement input
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void AMyPlayerController::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Add right movement input
        AddMovementInput(GetActorRightVector(), Value);
    }
}