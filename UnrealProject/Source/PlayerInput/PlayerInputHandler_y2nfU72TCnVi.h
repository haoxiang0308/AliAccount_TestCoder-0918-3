// PlayerInputHandler_y2nfU72TCnVi.h
// A C++ class for handling player input in Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "InputActionValue.h"
#include "PlayerInputHandler_y2nfU72TCnVi.generated.h"

// Forward declarations
class UInputAction;
class UInputMappingContext;

UCLASS()
class APlayerInputHandler : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	// Input Mapping Context
	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputMappingContext* DefaultMappingContext;

	// Input Actions
	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputAction* MoveAction;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputAction* LookAction;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputAction* JumpAction;

	// Called for movement input
	void Move(const FInputActionValue& Value);

	// Called for looking input
	void Look(const FInputActionValue& Value);

	// Called for jump input
	void Jump();

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;
};