// PlayerInputHandler_ed05a73b.h
// Header file for player input handling component in Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "PlayerInputHandler_ed05a73b.generated.h"

class APawn;
class APlayerController;
class UInputComponent;

UCLASS(ClassGroup=(Custom), meta=(BlueprintSpawnableComponent))
class UPlayerInputHandler : public UActorComponent
{
	GENERATED_BODY()

public:
	// Sets default values for this component's properties
	UPlayerInputHandler();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

	// Setup input bindings (to be called during pawn setup)
	void SetupInputBindings(UInputComponent* InputComponent);

private:
	// Process player input
	void ProcessInput();

	// Move the pawn based on input
	void MovePawn(FVector Direction);

	// Handle jump action
	void HandleJumpAction();

	// Axis input functions
	void MoveForward(float Value);
	void MoveRight(float Value);

private:
	// Reference to the owning pawn
	UPROPERTY()
	APawn* OwningPawn;

	// Reference to the player controller
	UPROPERTY()
	APlayerController* OwningController;

	// Movement speed
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Movement")
	float MoveSpeed = 100.0f;
};