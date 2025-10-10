#include "MyPlayerController.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/Character.h"

AMyPlayerController::AMyPlayerController()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Ensure InputComponent is valid
	if (!InputComponent) return;

	// Bind axis mappings
	InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
	InputComponent->BindAxis("LookUp", this, &AMyPlayerController::LookUp);
	InputComponent->BindAxis("Turn", this, &AMyPlayerController::Turn);

	// Bind action mappings
	InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
}

void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();
	// Initialization logic can go here
}

void AMyPlayerController::MoveForward(float Value)
{
	// Check if the controlled pawn is a character
	if (Value != 0.0f && GetPawn() != nullptr)
	{
		// Cast to a character to access movement functions
		ACharacter* ControlledCharacter = Cast<ACharacter>(GetPawn());
		if (ControlledCharacter != nullptr)
		{
			// Add movement input in the forward direction of the character
			ControlledCharacter->AddMovementInput(ControlledCharacter->GetActorForwardVector(), Value);
		}
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	// Check if the controlled pawn is a character
	if (Value != 0.0f && GetPawn() != nullptr)
	{
		// Cast to a character to access movement functions
		ACharacter* ControlledCharacter = Cast<ACharacter>(GetPawn());
		if (ControlledCharacter != nullptr)
		{
			// Add movement input in the right direction of the character
			ControlledCharacter->AddMovementInput(ControlledCharacter->GetActorRightVector(), Value);
		}
	}
}

void AMyPlayerController::LookUp(float Value)
{
	// Add camera look-up input to the controlled pawn
	if (Value != 0.0f)
	{
		AddControllerPitchInput(Value);
	}
}

void AMyPlayerController::Turn(float Value)
{
	// Add camera turn input to the controlled pawn
	if (Value != 0.0f)
	{
		AddControllerYawInput(Value);
	}
}

void AMyPlayerController::Jump()
{
	// Check if the controlled pawn is a character
	if (GetPawn() != nullptr)
	{
		ACharacter* ControlledCharacter = Cast<ACharacter>(GetPawn());
		if (ControlledCharacter != nullptr && ControlledCharacter->CanJump())
		{
			ControlledCharacter->Jump();
		}
	}
}