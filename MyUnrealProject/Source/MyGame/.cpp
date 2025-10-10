#include "MyGamePlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"

AMyGamePlayerController::AMyGamePlayerController()
{
	// Enable ticking for this controller
	PrimaryActorTick.bCanEverTick = true;
}

void AMyGamePlayerController::SetupInputComponent()
{
	// Call the base setup method
	Super::SetupInputComponent();

	// Get the Enhanced Input Component
	UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent);
	if (!EnhancedInputComponent) return;

	// Example: Bind actions here if UInputActions are defined in a UInputMappingContext
	// EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &AMyGamePlayerController::MoveForward);
	// EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &AMyGamePlayerController::MoveRight);
	// EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyGamePlayerController::Jump);
}

void AMyGamePlayerController::MoveForward(float Value)
{
	// Add movement logic here
}

void AMyGamePlayerController::MoveRight(float Value)
{
	// Add movement logic here
}

void AMyGamePlayerController::LookUp(float Value)
{
	// Add look up logic here
}

void AMyGamePlayerController::Turn(float Value)
{
	// Add turn logic here
}

void AMyGamePlayerController::Jump()
{
	// Add jump logic here
}

void AMyGamePlayerController::Fire()
{
	// Add fire logic here
}