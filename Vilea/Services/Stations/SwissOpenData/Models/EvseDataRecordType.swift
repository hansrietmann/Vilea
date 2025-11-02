//
//  EvseDataRecordType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct EvseDataRecordType: Decodable {
    /// In case that the operation “PullEvseData” is performed with the parameter “LastCall”, Hubject assigns this attribute to every response EVSE record in order to return the changes compared to the last call.
    let deltaType: DeltaType?
    /// The attribute indicates the date and time of the last update of the record. Hubject assigns this attribute to every response EVSE record.
    let lastUpdate: String?
    /// The ID that identifies the charging spot.
    let EvseID: String
    /// The ID that represents a collection of charging stations managed as a group.
    let ChargingPoolID: String?
    /// The ID that identifies the charging station.
    let ChargingStationId: String?
    /// Name of the charging station
    let ChargingStationNames: SwissOpenDataArray<InfoTextType>?
    /// Name of the charging point manufacturer
    let HardwareManufacturer: String?
    /// URL that redirect to an online image of the related EVSEID
    let ChargingStationImage: String?
    /// Name of the Sub Operator owning the Charging Station
    let SubOperatorName: String?
    /// Address of the charging station.
    let Address: AddressIso19773Type
    /// Geolocation of the charging station.
    let GeoCoordinates: GeoCoordinatesType
    /// List of plugs that are supported.
    let Plugs: [String]
    /// Informs is able to deliver different power outputs.
    let DynamicPowerLevel: Bool?
    /// List of facilities that are supported.
    let ChargingFacilities: [ChargingFacilityType]
    /// If the Charging Station provides only renewable energy then the value MUST be” true”, if it use grey energy then value MUST be “false”.
    let RenewableEnergy: Bool
    /// List of energy source that the charging station uses to supply electric energy.
    let EnergySource: EnergySourceType?
    /// Environmental Impact produced by the energy sources used by the charging point
    let EnvironmentalImpact: EnvironmentalImpactType?
    /// This field gives the information how the charging station provides metering law data.
    let CalibrationLawDataAvailability: CalibrationLawDataAvailabilityType
    /// List of authentication modes that are supported.
    let AuthenticationModes: [AuthenticationModeType]
    /// This field is used if the EVSE has a limited capacity (e.g. built-in battery). Values must be given in kWh.
    let MaxCapacity: Int?
    /// List of payment options that are supported.
    /// No Payment can not be combined with other payment option
    let PaymentOptions: [PaymentOptionType]?
    /// List of value added services that are supported.
    let ValueAddedServices: [ValueAddedServiceType]?
    /// Specifies how the charging station can be accessed.
    let Accessibility: AccessibilityType
    /// Inform the EV driver where the ChargingPoint could be accessed.
    let AccessibilityLocation: AccessibilityLocationType?
    /// Phone number of a hotline of the charging station operator
    let HotlinePhoneNumber: String
    /// Optional information.
    let AdditionalInfo: [InfoTextType]?
    /// Last meters information regarding the location of the Charging Station
    let ChargingStationLocationReference: [InfoTextType]?
    /// In case that the charging spot is part of a bigger facility (e.g. parking place), this attribute specifies the facilities entrance coordinates.
    let GeoChargingPointEntrance: GeoCoordinatesType?
    /// Set in case the charging spot is open 24 hours.
    let IsOpen24Hours: SwissOpenDataBool
    /// Opening time in case that the charging station cannot be accessed around the clock.
    let OpeningTimes: [OpeningTimesType]?
    let HubOperatorID: String?
    /// Identification of the corresponding clearing house in the event that roaming between different clearing houses MUST be processed in the future.
    let ClearinghouseID: String?
    /// Is eRoaming via intercharge at this charging station possible? If set to "false" the charge spot will not be started/stopped remotely via Hubject.
    let IsHubjectCompatible: SwissOpenDataBool
    /// Values; true / false / auto This attribute indicates whether a CPO provides (dynamic) EVSE Status info in addition to the (static) EVSE Data for this EVSERecord. Value auto is set to true by Hubject if the operator offers Hubject EVSEStatus data.
    let DynamicInfoAvailable: DynamicInfoAvailable
}
