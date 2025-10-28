#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputMappingContext.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();

	// Get the Enhanced Input subsystem
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
	{
		// Add the mapping context to the subsystem
		Subsystem->AddMappingContext(InputMappingContext, 0);
	}
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Cast the InputComponent to the EnhancedInputComponent
	UEnhancedInputComponent* PlayerInputComponent = Cast<UEnhancedInputComponent>(InputComponent);
	if (PlayerInputComponent)
	{
		// Bind actions for movement
		PlayerInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
		PlayerInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

		// Bind actions for looking
		PlayerInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
		PlayerInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);

		// Bind actions for gameplay
		PlayerInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);
		PlayerInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &APlayerInputHandler::Fire);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Add look up/down input
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Add turn input
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	// This is called when the jump input action is triggered
	// You can add your jump logic here
	// For example:
	// ACharacter* Character = Cast<ACharacter>(GetPawn());
	// if (Character)
	// {
	//     Character->Jump();
	// }
}

void APlayerInputHandler::Fire()
{
	// Handle fire action
	// This is called when the fire input action is triggered
	// You can add your fire logic here
	// For example, spawning a projectile or calling a weapon function
}