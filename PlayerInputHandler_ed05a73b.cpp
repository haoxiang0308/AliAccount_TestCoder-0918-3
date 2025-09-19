// PlayerInputHandler_ed05a73b.cpp
// Implementation of player input handling for Unreal Engine

#include "PlayerInputHandler_ed05a73b.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/PlayerController.h"
#include "Engine/World.h"

// Sets default values for this component's properties
UPlayerInputHandler::UPlayerInputHandler()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.
	PrimaryComponentTick.bCanEverTick = true;
}

// Called when the game starts
void UPlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Get reference to the owner pawn and player controller
	OwningPawn = GetOwner<APawn>();
	if (OwningPawn)
	{
		OwningController = OwningPawn->GetController<APlayerController>();
	}
}

// Called every frame
void UPlayerInputHandler::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// Process input each frame if we have a controller
	if (OwningController && OwningPawn)
	{
		ProcessInput();
	}
}

// Process player input
void UPlayerInputHandler::ProcessInput()
{
	// Example input handling - these would typically be bound to input actions
	// For demonstration, we're checking input state directly
	// In a real implementation, you would bind actions in the input mapping context
	
	// Movement input
	FVector MovementVector = FVector::ZeroVector;
	
	// Forward/backward movement
	if (OwningController->IsInputKeyDown(EKeys::W))
	{
		MovementVector.X += 1.0f;
	}
	if (OwningController->IsInputKeyDown(EKeys::S))
	{
		MovementVector.X -= 1.0f;
	}
	
	// Left/right movement
	if (OwningController->IsInputKeyDown(EKeys::D))
	{
		MovementVector.Y += 1.0f;
	}
	if (OwningController->IsInputKeyDown(EKeys::A))
	{
		MovementVector.Y -= 1.0f;
	}
	
	// Normalize and apply movement
	if (!MovementVector.IsNearlyZero())
	{
		MovementVector.Normalize();
		MovePawn(MovementVector);
	}
	
	// Action input example
	if (OwningController->WasInputKeyJustPressed(EKeys::SpaceBar))
	{
		HandleJumpAction();
	}
}

// Move the pawn based on input
void UPlayerInputHandler::MovePawn(FVector Direction)
{
	if (OwningPawn)
	{
		// Simple movement implementation
		// In a real game, you would use the CharacterMovementComponent or similar
		FVector NewLocation = OwningPawn->GetActorLocation() + (Direction * MoveSpeed * GetWorld()->GetDeltaSeconds());
		OwningPawn->SetActorLocation(NewLocation);
	}
}

// Handle jump action
void UPlayerInputHandler::HandleJumpAction()
{
	// Implement jump logic here
	// This is just a placeholder that prints to log
	UE_LOG(LogTemp, Log, TEXT("Jump action performed!"));
}

// Setup input bindings (to be called during pawn setup)
void UPlayerInputHandler::SetupInputBindings(UInputComponent* InputComponent)
{
	if (InputComponent)
	{
		// Bind actions to functions
		// This is the preferred way to handle input in Unreal Engine
		InputComponent->BindAction("Jump", IE_Pressed, this, &UPlayerInputHandler::HandleJumpAction);
		
		// Bind axis inputs for movement
		InputComponent->BindAxis("MoveForward", this, &UPlayerInputHandler::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &UPlayerInputHandler::MoveRight);
	}
}

// Axis input functions
void UPlayerInputHandler::MoveForward(float Value)
{
	if (OwningPawn && Value != 0.0f)
	{
		// Find forward direction
		FRotator Rotation = OwningPawn->GetActorRotation();
		FRotator YawRotation(0, Rotation.Yaw, 0);
		
		// Move in forward direction
		FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		OwningPawn->AddMovementInput(Direction, Value);
	}
}

void UPlayerInputHandler::MoveRight(float Value)
{
	if (OwningPawn && Value != 0.0f)
	{
		// Find right direction
		FRotator Rotation = OwningPawn->GetActorRotation();
		FRotator YawRotation(0, Rotation.Yaw, 0);
		
		// Move in right direction
		FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		OwningPawn->AddMovementInput(Direction, Value);
	}
}